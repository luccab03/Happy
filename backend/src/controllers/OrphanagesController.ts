import { Request, Response } from "express";
import { getRepository } from "typeorm";
import orphanageView from "../views/orphanages_view";
import Orphanage from "../models/Orphanage";
import * as Yup from "yup";

export default {
    async index(request: Request, response: Response) {
        const orphanageRepository = getRepository(Orphanage);
        const orphanages = await orphanageRepository.find({
            relations: ["images"],
        });
        return response.json(orphanageView.renderMany(orphanages));
    },

    async show(request: Request, response: Response) {
        const { id } = request.params;
        const orphanageRepository = getRepository(Orphanage);
        const orphanage = await orphanageRepository.findOneOrFail(id, {
            relations: ["images"],
        });
        return response.json(orphanageView.render(orphanage));
    },

    async create(request: Request, response: Response) {
        const {
            name,
            latitude,
            longitude,
            about,
            instructions,
            opening_hours,
            open_on_weekends,
        } = request.body;

        const orphanageRepository = getRepository(Orphanage);
        const requestImages = request.files as Express.Multer.File[];
        const images = requestImages.map((image) => {
            return { path: image.filename };
        });
        const data = {
            name,
            latitude,
            longitude,
            about,
            instructions,
            opening_hours,
            open_on_weekends: open_on_weekends === "true",
            images,
        };

        const schema = Yup.object().shape({
            name: Yup.string().required("O nome é obrigatório"),
            latitude: Yup.number().required("A latitude é obrigatória"),
            longitude: Yup.number().required("A longitude é obrigatória"),
            about: Yup.string().required("O sobre é obrigatório").max(300),
            instructions: Yup.string().required("As instruções são obrigatórias"),
            opening_hours: Yup.string().required("As horas de abertura são obrigatórias"),
            open_on_weekends: Yup.boolean().required("Se abre nos finais de semana é obrigatório"),
            images: Yup.array(
                Yup.object().shape({
                    path: Yup.string().required(),
                })
            ).required(),
        });

        await schema.validate(data, { abortEarly: false });

        const orphanage = orphanageRepository.create(data);

        await orphanageRepository.save(orphanage);

        return response.status(201).json(orphanage);
    },
};
